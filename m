From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [5/5] ARM: tegra: jetson-tk1: enable GK20A GPU
Date: Fri, 26 Sep 2014 13:44:51 +0900
Message-ID: <5424EF43.300@nvidia.com>
References: <1400491450-19223-6-git-send-email-acourbot@nvidia.com> <20140925132717.GA13579@dusk.luon.net> <54243931.6050804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54243931.6050804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sjoerd Simons <sjoerd-FGvqe4uplSY@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/26/2014 12:48 AM, Stephen Warren wrote:
> On 09/25/2014 07:27 AM, Sjoerd Simons wrote:
>> Playing a bit with todays linux-next on my jetson, it seems this patch is
>> still required for enabling the GPU. Is there anything blocking it
>> (firmware
>> not available yet in liux-firmware?)
>
> I think initially I was waiting for the DRM patch "drm/nouvea: support
> for probing platform devices" to be applied, but it looks like that's
> been applied already, so only patches 4 and 5 in this series are still
> outstanding.

Actually I am waiting for the firmware and firmware loading support 
patch to land in linux-firmware and Nouveau respectively. I have yet to 
send these patches publicly due to some ongoing discussion about the 
firmware's license.

For now if you want to run Nouveau on TK1, the easiest solution is to 
use my kernel and Nouveau branches. The branches that should be used are 
visible in the manifest of 
https://github.com/Gnurou/tegra-nouveau-rootfs - which BTW also provides 
an easy way to enable the FOSS graphics stack on a L4T image (minus the 
firmware at the moment).

More generally speaking, I still have a lot of patches to upstream - I 
apologize for not having been able to catch up with them. Things have 
been busy on other fronts, but since these other fronts are soon not 
going to be a concern anymore I will be able to focus on Nouveau again 
after mid-next week. :)

>
> Alex, wasn't there also some issue where the VPR register had to be
> programmed, and if it wasn't there'd be a hang when the GPU registers
> were touched? If we've added code to Nouveau/tegradrm to detect that and
> avoid the problem, then I guess we can commit these last two patches for
> 3.19. A resend after the 3.18 merge window might help.

The VPR patch has landed in U-boot mainline, so this should be less of a 
problem now. AFAIK there is no safe way to check whether VPR has been 
disabled, but the solution might be in your suggestion to make the 
bootloader enable the GPU DT node if it finds it safe to do so.
