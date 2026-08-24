Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE0376475
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575293; cv=none; b=m+w6Hq6weX6CYhJJ65WIP0aasUJJHPXEJlMByKWIJr2rgzTX7B52JL3uSFYJ1u3N2yZsqkgBLcblLKzIETddjqIV8hsiTOZ69YNnBBzi6KRLVYD0pL7nJIrpB1fMU81WcT7o9/Jr7dGjicIp4zb7fjff1nMHAASH9lRFlxlL94Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575293; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRDYWLGmJ3xhDDjx1lOkVoQaZz1eYszRWSCrJfCDZ/1HPDGO7AnBNc5llwIAA2pfJdy0QLsLf+NUkKAnAjWBSHlpb/k/MJ6i2JJ1V6/ynColGQGg1DdbYwFgM41ChCwYZPjiVEJlTp2CSWVvmvzxwvLrgvg4reiDNpiZdj9baJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97c367c9f12so635767241.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 05:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575290; x=1788180090;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=SAYUh1XtAAxzLu8QvKhgjrSJsAJ+FIc7aU4EdDsyOu1MaIWXBP2QuVAW84UoyBc2sC
         JaOpkrcK57+AINKb98TjZ8jjRUC0WoWhKcKqLrbAPdcBDFuqoMgD8IRkt6fXt4OteeOq
         Jd+JO39YqLQXaN7i9rsWFgjcRdYOecPsWEcRmCMeqimKVWMrLwTpbHPQ+/0pna1cJe5/
         zV6ZBNQdPU6qI5Wjryh7GfYSJjKqNNYou/uCqrGqzZD/2t6BrH45lQXQLmLfDhVtVihM
         mb1pjdgOY/mP7lWsYbpKfi8BkziqNEoHN1cooQ90JsmcFwRLImlTn3Z7NAU77I/WZNkQ
         EEiQ==
X-Forwarded-Encrypted: i=1; AHgh+RozN/MbWoYh5FdHspad3AW49nff2MS04WalByuiKzQaK5Cch5Pzp3hdyJNOggUrqbF2VF2Tn55gx/GfoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nLmJ0tqxB8E9nSiM+YYwJWW/8CHnSIRUAtraTvAnnjnR4Ywm3L
	SlUToB6td9R4H5t0J4qXfVyTNT8Muq1WSBx4GlRdBIT+jNUaRwZN4cxDYvdHVWx1
X-Gm-Gg: AR+sD10G/d+EbwhkEHPlpjyAO6+VZvbZeldtorzr2I0nqxWjstpCqY4Uil5ShD1dD4h
	oSzEzFrGaBXy7VIg0ucI4/Pke5Hzc5zy6ydhK/FSjMR1yMinUvNRGsVpH0Bv7Eum15230xM1DKk
	Tk9w0OAP0G5RoEGXiAtts5rQlluUjWeRmeORAndd3ETJGQywzkigpjqU77/bj9De0h+4kiUmdic
	vy8mvebu4v6MMjCtcXpx/XigMijxXfFLmHZVqV+NNm3yKuCDy9XttG0bPfczQsqj+01QcGIMz6n
	0EmhxIbFN1aE95HFJEAdNYh0hpy/86urb0g7DSEpIHydSaEETAQYtBq7JDJB0MlqJ049XDiCDqN
	eRvPs9K0uzfmXYzH7CmBgZyt6WVD2CVw7/0f0LQf3s8DiDAnLy/j9JoNscGZ9FOcjpNcmWfKlFC
	T0fe5Wf31SQpQPwcAEWP2fZZ4Chr4Gf6hBFI/oAGKutP0fhw7+E1BFFpQ6bv+KoptWjXbLic83I
	eJzqyF9VkfF1I4B4GrZLQUEBrAA34/t9S/L
X-Received: by 2002:a05:6102:304f:b0:77e:7a57:dd89 with SMTP id ada2fe7eead31-77e7a57ef7cmr1602252137.5.1787575290439;
        Mon, 24 Aug 2026 05:41:30 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d856d919esm2852949137.8.2026.08.24.05.41.29
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:41:29 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-777ae5e5caeso1067688137.2
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 05:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3hy6j9cG3FFpFvGL0MMqQ0ZRv3/xAGmEXO3rsyleMhEVESv1IFufiIdNQ6UARqE22W8rdPTA3J1VObA==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
