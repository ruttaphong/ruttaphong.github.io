module Jekyll

    class ProjectPage < Page
        def initialize(site, base, dir, project_data)
            @site = site
            @base = base
            @dir = dir
            @name = "index.html"

            self.process(@name)
            self.read_yaml(File.join(base, "_layouts"), "project.html")

            project_data.each { |key, value| self.data[key] = value }
        end
    end

    class PortfolioGenerator < Generator
    	safe true

    	def generate(site)
            dir = site.config["portfolio_dir"] || "portfolio"

            # First get the related projects and add them to each project
            unless site.config["skip_related_projects"] == true
                raise ArgumentError.new "Missing related_project_keys in config file" unless site.config["related_project_keys"]
                compute_related_projects(site)
            end

            # Then generate the project pages
            site.data["projects"].each do |project_file|
                project = project_file[1]

                # I Love Cats -> i-love-cats
                file_name_slug = slugify(project["title"])

                # portfolio/i-love-cats/
                path = File.join(dir, file_name_slug)
                project["dir"] = path

                site.pages << ProjectPage.new(site, site.source, path, project)
            end
        end


        def slugify(title)
            title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end

    end
    
    module ProjectFilter
        def get_projects_from_files(input)
            projects = []
            input.each { |project| projects.push(project[1]) }
            return projects
        end
    end

end

Liquid::Template.register_filter(Jekyll::ProjectFilter)
