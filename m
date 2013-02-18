From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Mon, 18 Feb 2013 17:07:54 +0800
Message-ID: <5121EF6A.5020101@gmail.com>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de> <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de> <5121C791.3040903@gmail.com> <20130218064832.GB30856@avionic-0098.mockup.avionic-design.de> <5121D2E2.7080905@gmail.com> <20130218072057.GA31486@avionic-0098.mockup.avionic-design.de> <5121E8EB.1050102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5121E8EB.1050102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/18/2013 04:40 PM, Mark Zhang wrote:
> On 02/18/2013 03:20 PM, Thierry Reding wrote:
[...]
>>
> 
> Actually the dc which connects with LVDS doesn't know about 1080p
> stuffs. All the video mode infos stored in this dc is still 1366x768(I
> just checked the register values on my Tegra 30 cardhu). The dc just
> scans 1366 pixels then jump to next line(based on the 1080p line stride
> we set) and keep scanning.
> 
> So the drm crtc helper(I believe it's function:
> drm_crtc_helper_set_config) finds out that video mode is not changed so
> a fb_change while not full modeset is triggered.
> 
> I started to test this new series patch set just now. I'll let you know
> whether the issue I described still exists.
> 

Tested. This issue still exists.

Mark
> Mark
>> Thierry
>>
