From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/2] Device tree updates for host1x support
Date: Fri, 09 Nov 2012 10:34:41 -0700
Message-ID: <509D3EB1.8040703@wwwdotorg.org>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352467202-27903-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 06:20 AM, Thierry Reding wrote:
> This set of patches are in preparation for the Tegra DRM driver. They
> add the necessary nodes to the DTSI files and setup the clocks necessary
> for host1x and the display controllers to work properly. The AUXDATA
> table is updated with the entries for the newly added nodes and the PLL
> frequency tables are extended with some frequencies required to make a
> few of the more common LVDS panel and HDMI display modes work.
> 
> By default, all output resources (RGB, HDMI, DSI and TVO) are disabled,
> and individual boards need to enable those that they require.
> 
> Note that there has been talk to replace the frequency tables by an
> algorithmic computation of the dividers in order to avoid endless
> additions to these tables. No code has surfaced yet, but eventually this
> should replace the static tables.

This basically looks reasonable.

I assume the DT bindings are documented in the tegradrm driver series? I
haven't looked at that yet.

I'd like to see explicit acks for the DT changes from e.g. Terje and
Mark Zhang, and anyone else involved in previous discussions about them.

Could you please split up the patches a little differently? I'd like to see:

1) Changes to the clock driver
2) Changes to add AUXDATA
3) Changes to .dts files

The reason being that these are logically separate changes. (1) and (2)
would be applied to the "soc" branch, and (3) to the "dt" branch.

Finally, I'd prefer not to rename the match parameters in the clock
drivers any more; just set up the AUXDATA to match whatever driver names
the clock driver is expecting. That will reduce churn to the clock
driver. I really hope soon that Tegra will support DT bindings for
clocks so we can get rid of the AUXDATA, but unfortunately I haven't
seen any movement towards this:-(

Thanks.
