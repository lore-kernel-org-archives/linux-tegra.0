From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] ARM: tegra: ventana: enable internal display
Date: Mon, 19 Nov 2012 22:08:20 -0700
Message-ID: <50AB1044.5030704@wwwdotorg.org>
References: <1353318187-26484-1-git-send-email-acourbot@nvidia.com> <50AADEE5.2030302@nvidia.com> <6034130.4mMqBdPRel@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6034130.4mMqBdPRel@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/19/2012 06:47 PM, Alex Courbot wrote:
> On Tuesday 20 November 2012 09:37:41 Mark Zhang wrote:
>> Great. So this means I2C2 is used for LCD and HDMI both. While HDMI is
>> not plugged, the EDID of LCD will be checked out, right?
> 
> Ahhh. So that's why the LCD DDC was not working during my previous tests - I 
> had HDMI nodes in my DT as well as the HDMI cable plugged! Indeed, things seem 
> to work as you described. I assumed the i2cmux node would set the right pin 
> configuration according to whether we want to read the LCD or HDMI DDC, but 
> apparently this is not totally working yet. Glad we figured it out. Adding the 
> HDMI nodes to Ventana will probably require to fix this (along with other 
> things, probably) first.

That is kinda the whole point of the I2C mux... If it really isn't
working, can you please investigate why. i2cdump or i2cget would be
useful tools for testing this.
