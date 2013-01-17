From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Thu, 17 Jan 2013 12:49:07 +0800
Message-ID: <50F782C3.5000305@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>  <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>  <50F68AB2.4030408@gmail.com> <1358337215.3157.3.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358337215.3157.3.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 07:53 PM, Lucas Stach wrote:
> Am Mittwoch, den 16.01.2013, 19:10 +0800 schrieb Mark Zhang:
>> I'm testing the pageflip & vblank change on cardhu. Seems the HDMI
>> doesn't work(LVDS only is OK). I'll let you know if I get something.
>>
> Just to provide another data point: I'm running this series and don't
> see any failures with DVI output. Though I'm only run a single output,
> not some dual-head config.
>

Yes. HDMI only is OK. I met some problems when the LVDS & HDMI are
enabled at the same time.

Mark
> Even vbltest from libdrm/tests works and shows correct refresh rate.
> 
> Regards,
> Lucas
> 
