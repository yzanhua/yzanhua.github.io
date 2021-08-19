module Jekyll
    class WithinFolderPostNavigation < Generator
      def generate(site)
        site.folder.each_pair do |folder, posts|
          posts.sort! { |a,b| b <=> a}
          posts.each do |post|
            index = posts.index post
            next_in_folder = nil
            previous_in_folder = nil
            if index
              if index < posts.length - 1
                next_in_folder = posts[index + 1]
              end
                if index > 0
                previous_in_folder = posts[index - 1]
              end
            end
            post.data["next_in_folder"] = next_in_folder unless next_in_folder.nil?
            post.data["previous_in_folder"] = previous_in_folder unless previous_in_folder.nil?
          end
        end
      end
    end
  end