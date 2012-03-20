From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] pinctrl: implement pinctrl_check_ops
Date: Tue, 20 Mar 2012 13:14:24 +0100
Message-ID: <CACRpkdY4gStxWTRXnpAPj8ko3d5Cr9N4OGanFWJDt-O-psOFeg@mail.gmail.com>
References: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
	<1331931269-12262-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331931269-12262-4-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@stericsson.com>, B29396@freescale.com, s.hauer@pengutronix.de, dongas86@gmail.com, shawn.guo@linaro.org, thomas.abraham@linaro.org, tony@atomide.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 16, 2012 at 9:54 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> Most code assumes that the pinctrl ops are present. Validate this when
> registering a pinctrl driver. Remove the one place in the code that
> was checking whether one of these non-optional ops was present.
>
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>

Good idea, applied.

Yours,
Linus Walleij
