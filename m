From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 16:05:33 -0600
Message-ID: <50807D2D.10607@wwwdotorg.org>
References: <50775803.1010209@wwwdotorg.org> <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de> <507888D0.1090103@wwwdotorg.org> <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com> <20121017065547.GE21783@avionic-0098.mockup.avionic-design.de> <507ECCCD.7000600@wwwdotorg.org> <D6C615D3E4730340AE82D5BD856631C0A1DA306B31@HQMAIL02.nvidia.com> <20121017191240.GA22570@avionic-0098.mockup.avionic-design.de> <507F0A03.2050008@wwwdotorg.org> <D6C615D3E4730340AE82D5BD856631C0A1DA306B39@HQMAIL02.nvidia.com> <20121018062918.GC24637@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121018062918.GC24637-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 12:29 AM, Thierry Reding wrote:
...
> According to the TRM, both the Tegra20 and the Tegra30 have only a 
> single HDMI output. Is that information wrong or are you talking
> about newer generations?

This isn't exactly what you asked, but:

TrimSlice pretends to have two HDMI outputs by using the real HDMI for
one connector, and converting the LVDS output to DVI signalling using
an external encoder/PHY, and routing the signals to an HDMI
form-factor connector.
