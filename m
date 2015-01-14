From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] conf/ucm: GoogleNyan: Add configuration
Date: Wed, 14 Jan 2015 10:14:17 -0700
Message-ID: <54B6A3E9.8010703@wwwdotorg.org>
References: <1421254638-14599-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421254638-14599-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/14/2015 09:57 AM, Tomeu Vizoso wrote:
> Taken from the ChromeOS sources, this configuration should apply to all
> Nyan boards from Google, so far HP Chromebook 14 (nyan-blaze) and Acer
> Chromebook 13 (nyan-big).

How does user-space correlate the files added here:

>   src/conf/ucm/GoogleNyan/GoogleNyan.conf |  5 ++
>   src/conf/ucm/GoogleNyan/HiFi.conf       | 83 +++++++++++++++++++++++++++++++++
>   src/conf/ucm/GoogleNyan/Makefile.am     |  4 ++

... with the (DT-provided) ASoC card name, or DT compatible value:

         sound {
                 compatible = "nvidia,tegra-audio-max98090-nyan-big",
                              "nvidia,tegra-audio-max98090";
                 nvidia,model = "Acer Chromebook 13";

I would have expected either the file/directory names in this repo to 
match the ASoC card name that the kernel exposes (derived from the model 
string above), or that the files here contain some kind of indexable 
string that contains the kernel's ASoC card name. Is that not how the 
UCM repo usually works?

Otherwise, generic distro UCM init scripts aren't possible; UCM setup 
scripts would need a huge table mapping ASoC card name to UCM repo 
file/directory name, which doesn't seem scalable.
