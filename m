From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] ARM: tegra: export tegra_gpio_{en,dis}able
Date: Mon, 12 Mar 2012 11:43:04 -0600
Message-ID: <20120312174304.8286D3E07B0@localhost>
References: <1330630010-11241-2-git-send-email-alan@signal11.us> <1330727544-11617-1-git-send-email-alan@signal11.us> <4F5A3726.8030505@signal11.us> <4F5A3965.5040300@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F5A3965.5040300@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Alan Ott <alan@signal11.us>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Olof Johansson <olof@lixom.net>
List-Id: linux-tegra@vger.kernel.org

On Fri, 09 Mar 2012 10:09:57 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 03/09/2012 10:00 AM, Alan Ott wrote:
> > On 03/02/2012 05:32 PM, Alan Ott wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> These two functions are used in drivers that can be
> >> modules, so they need to be exported.
> >>
> >> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> >> Acked-by: Olof Johansson <olof@lixom.net>
> ...
> > Did this patch ever get picked up into someone's tree?
> 
> It looks like Grant ack'd it which implies the thought Olof was going to
> take it through the Tegra tree perhaps? But Olof did the same, so is
> probably waiting for Grant to take it...

Applied, thx.

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
