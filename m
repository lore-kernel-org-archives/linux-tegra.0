From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] drm/panel: sharp: lq101r1sx01: Send cmds to panel
 from link2
Date: Thu, 26 Mar 2015 09:12:25 +0800
Message-ID: <55135CF9.80100@nvidia.com>
References: <1427266602-31905-1-git-send-email-markz@nvidia.com> <5512C384.3070803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5512C384.3070803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I've talked with Thierry about this. The patch doesn't make sense for
now. So please ignore it, thanks Stephen/Thierry.

Mark
On 03/25/2015 10:17 PM, Stephen Warren wrote:
> On 03/25/2015 12:56 AM, Mark Zhang wrote:
>> Sharp lq101r1sx01 panel works as left-right gang mode. So link2
>> should send cmds like "exit sleep mode", "set display on"
>> to panel as well.
> 
> What's the changelog v1->v2?
> 
> I expect you should CC the DRM list and maintainer too?
