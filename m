From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt: bindings: mtd: replace references to nand.txt with nand-controller.yaml
Date: Wed, 22 May 2019 08:55:53 -0500
Message-ID: <CAL_JsqJ+zNQ3CeBh8K=oBiZZsiBQ8w1w=6vs8zOQeqUf_qhqcg@mail.gmail.com>
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com> <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamal Dasu <kdasu.kdev@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liang Yang <liang.yang@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <narmstrong@baylibre.com>, Andy Gross <agross@ker>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 22, 2019 at 8:19 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > nand-controller.yaml replaced nand.txt however the references to it were
> > not updated. This change updates these references wherever it appears in
> > bindings documentation.
> >
> > Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>
> Mauro already sent a similar patch.

Actually, Mauro's patch missed a bunch of cases that aren't full
paths, so I'll take this one.

Rob
