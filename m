From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 00/10] ARM: tegra: DSI and panel support
Date: Fri, 20 Dec 2013 11:16:23 +0100
Message-ID: <1462944.fRZN5UYlz3@fb07-iapwap2>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com> <52B35346.1070202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B35346.1070202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Am Donnerstag, 19. Dezember 2013, 13:12:54 schrieb Stephen Warren:
> On 12/19/2013 08:59 AM, Thierry Reding wrote:
> > This series of patches add support for Tegra114 display, DSI, HDMI, gr2d
> > and gr3d. Both DSI and HDMI outputs are enabled on Dalmore.
> > 
> > The LVDS panels on Harmony and Cardhu are added to the corresponding DTS
> > files and support for panels is enabled in the Tegra defconfig.
> 
> Very nice, and it all works and applies without conflicts:-) :-) :-)
> 
> Now I must run off and do the panels for Seaboard, Ventana, and the
> AC100 sometime.

no need for AC100, I'll submit a patch for it soon. They are already in one of 
my testing branches [1].

Thanks

Marc

[1] https://gitorious.org/ac100/marvin24s-kernel/commits/eab9a9a58b23d317c8cef9ba9b0a6ff2d7e25136
