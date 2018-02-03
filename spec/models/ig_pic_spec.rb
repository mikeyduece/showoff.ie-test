require 'rails_helper'

describe IgPic, type: :model do
  context 'Class Methods' do
    it '.initialize(params)' do
      params = {:id=>"1394964495852177364_1179766273",
                :user=>
      {:id=>"1179766273",
       :full_name=>"Mike Heft",
       :profile_picture=>"https://instagram.flhe2-1.fna.fbcdn.net/vp/3230896e49952035c4a21d078561d30f/5B1DB27A/t51.2885-19/11906329_960233084022564_1448528159_a.jpg",
       :username=>"magicmikebjj"},
       :images=>
      {:thumbnail=>
       {:width=>150,
        :height=>150,
        :url=>"https://scontent.cdninstagram.com/vp/fe093645359787f3fa3157b9cfaf082a/5B236580/t51.2885-15/s150x150/e35/15251581_1294392557300208_3406988876340789248_n.jpg"},
        :low_resolution=>
       {:width=>320,
        :height=>320,
        :url=>"https://scontent.cdninstagram.com/vp/bfee8fdc525be382dbea2ddacc6e32f4/5B163FB0/t51.2885-15/s320x320/e35/15251581_1294392557300208_3406988876340789248_n.jpg"},
        :standard_resolution=>
       {:width=>640,
        :height=>640,
        :url=>"https://scontent.cdninstagram.com/vp/3c8d5df090cc19146f4a172e7f1557d4/5B0C18FD/t51.2885-15/s640x640/sh0.08/e35/15251581_1294392557300208_3406988876340789248_n.jpg"}},
        :created_time=>"1480512748",
        :caption=>
       {:id=>"17857873837078956",
        :text=>
       "#Repost @cors.life with @repostapp\n・・・\nThe only one in this pic not tan and not in the UFC is myself. @ufc let's put CO's top local guy and top international guy (me) on the January 28th Denver card. 5-0 with my opponents having over 30 total wins. I'm not scared of tough fights. Let me be great 💁🏻 #UFC #MMA #RFA #jiujitsu #bjj #kickboxing #elevationfightteam #musclepharm #welivethis #ufcdenver @neil_magny170 @iamtheimmortal @bojanvelickovicmma @drewdober @razorblaydes265 @brukus @tjdillashaw @musclepharm",
         :created_time=>"1480512748",
         :from=>
       {:id=>"1179766273",
        :full_name=>"Mike Heft",
        :profile_picture=>"https://instagram.flhe2-1.fna.fbcdn.net/vp/3230896e49952035c4a21d078561d30f/5B1DB27A/t51.2885-19/11906329_960233084022564_1448528159_a.jpg",
        :username=>"magicmikebjj"}},
        :user_has_liked=>false,
        :likes=>{:count=>134},
        :tags=>["ufc", "elevationfightteam", "rfa", "kickboxing", "mma", "welivethis", "jiujitsu", "musclepharm", "ufcdenver", "bjj", "repost"],
        :filter=>"Normal",
        :comments=>{:count=>4},
        :type=>"image",
        :link=>"https://www.instagram.com/p/BNb6NFxjQfU/",
        :location=>nil,
        :attribution=>nil,
        :users_in_photo=>[]}
      ip = IgPic.new(params)

      expect(ip). to be_a(IgPic)
      expect(ip.ig_user).to be_a(Hash)
      expect(ip.tags).to be_a(Array)
      expect(ip.image).to be_a(String)
      expect(ip.likes).to be_a(Integer)
      expect(ip.caption).to be_a(String)
    end
  end
end
