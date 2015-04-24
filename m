From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add missing HDMI +5V regulator
Date: Fri, 24 Apr 2015 11:05:37 -0600
Message-ID: <553A77E1.8030402@wwwdotorg.org>
References: <1429869954-5909-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429869954-5909-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/24/2015 04:05 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Commit fb50a116bbbc ("drm/tegra: hdmi - Add connector supply support")
> introduced a new supply for HDMI connectors that is used to control the
> voltage on the +5V pin. Not all boards have had the corresponding supply
> added to their device tree files, causing the following warning message
> during boot:
>
> 	[    0.859698] 54280000.hdmi supply hdmi not found, using dummy regulator
>
> Add such a regulator to the Seaboard DTS to enable the driver to control
> this voltage and get rid of the warning.
>
> Reported-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi Stephen,
>
> This is completely untested because I don't have a Seaboard. But this is
> based on the schematics and I think it should work, so it'd be great if
> you could test it.

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> (on top of v4.0).
