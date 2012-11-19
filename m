From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: ventana: enable internal display
Date: Mon, 19 Nov 2012 18:35:53 +0900
Message-ID: <4911534.ydU4D3qycf@percival>
References: <1353051891-26725-1-git-send-email-acourbot@nvidia.com> <2481172.Lt8JIisq3X@percival> <50A672DF.1070003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A672DF.1070003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 17 November 2012 01:07:43 Stephen Warren wrote:
> That should be equivalent to something like:
> 
> 	nvidia,ddc-i2c-bus = <&lcd_ddc>;
> 
> with lcd_ddc pointing at /i2cmux/i2c@1
> 
> That seems to work fine for me; how about you?

Yep, this is working! DC probing gets delayed probably because i2c is not 
available when it first tries to initialize it, and as a result fb0 becomes 
available 1 second later than when we feed the EDID data from the DT. But it 
work and is the most elegant solution, so we should definitely do this.

Alex.
