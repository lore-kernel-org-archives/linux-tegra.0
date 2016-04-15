From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] soc/tegra: pmc: Use BIT macro for register field definition
Date: Fri, 15 Apr 2016 09:44:23 +0200
Message-ID: <CACRpkdb0xKdwHqC-dof2sjvCftLs6-Vy14_x4joY12vLE=c13w@mail.gmail.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
	<1460473007-11535-2-git-send-email-ldewangan@nvidia.com>
	<20160412152642.GA30211@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160412152642.GA30211@ulmo.ba.sec>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 12, 2016 at 5:26 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Does this matter at all? We use the explicit notation in quite a number
> of places and it works great. I'd like to avoid needless churn unless
> there is a very good reason to switch.

I am softly enforcing <linux/bitops.h> in the GPIO subsystem
because I think it's a great perceptual aid, I can skim code
faster if this is used, easier for the brain to handle and thus
simplifies maintenance.

Others may disagree on its virtues.

It is not a subjective opinion, but proving the point needs
perceptual psychology research.

Yours,
Linus Walleij
