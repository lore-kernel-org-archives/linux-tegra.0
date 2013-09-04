From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/6] host1x: hdmi: Detect whether display is connected
 with HDMI or DVI
Date: Wed, 04 Sep 2013 12:40:58 -0600
Message-ID: <52277EBA.6030105@wwwdotorg.org>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com> <1377704922-2824-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377704922-2824-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 09:48 AM, Mikko Perttunen wrote:
> Use EDID data to determine whether the display supports HDMI or just DVI.
> This used to be hardcoded to be HDMI, which broke support for DVI displays
> that couldn't understand the interspersed audio/other data.
> 
> If the EDID data isn't available, default to DVI, which should be a safer
> choice.

This seems like a bug-fix that might even be worth CC: stable?
