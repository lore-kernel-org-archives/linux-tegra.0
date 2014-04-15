From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] USB: EHCI: tegra: set txfill_tuning
Date: Tue, 15 Apr 2014 10:07:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1404151006450.1310-100000@iolanthe.rowland.org>
References: <1397510483-21383-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397510483-21383-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 14 Apr 2014, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> To avoid memory fetch underflows with larger USB transfers, Tegra SoCs
> need txfill_tuning's txfifothresh register field set to a non-default
> value. Add a custom reset override in order to set this up.
> 
> These values are recommended practice for all Tegra chips. However,
> I've only noticed practical problems when not setting them this way on
> systems using Tegra124. Hence, CC: stable only for recent kernels which
> actually support Tegra124.
> 
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.14+
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
