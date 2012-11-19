From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: ventana: enable internal display
Date: Mon, 19 Nov 2012 10:55:42 +0800
Message-ID: <50A99FAE.3080207@nvidia.com>
References: <1353051891-26725-1-git-send-email-acourbot@nvidia.com> <2481172.Lt8JIisq3X@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2481172.Lt8JIisq3X@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Yep, I remember that I fetched EDID data by i2cget several months ago.
But I'll try this again today to make sure.

Mark
On 11/16/2012 03:51 PM, Alex Courbot wrote:
> On Friday 16 November 2012 15:44:51 Alexandre Courbot wrote:
>> Enable host1x and add the rgb output, providing EDID as a binary blob.
> 
> I would really prefer to have the EDID data fetched from DDC, but all my 
> attempts have failed so far. I don't even see the DDC wires on the platform 
> design guide. Mark, are you sure the EDID data you fetched with i2cget was 
> actually on Ventana? I can see that the DDC lines of T2 are connected to the 
> corresponding lines of the HDMI interface, but nothing similar regarding 
> internal display.
> 
> Maybe we can work this out privately, on IRC?
> 
> Alex.
> 
