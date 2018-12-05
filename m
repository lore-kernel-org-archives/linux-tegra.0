From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] genirq: Export irq_chip_set_wake_parent()
Date: Wed, 5 Dec 2018 22:31:55 +0100
Message-ID: <CACRpkdbRswRmMWFGuB6pMWeUVdB6=rxqC-o4ytv1VhK-2yjWDg@mail.gmail.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com> <20181129170312.23625-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129170312.23625-3-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Interrupt controllers in a hierarchy want to use this function to
> propogate ->irq_set_wake() operations to their parent domains.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Tglx/Marc: is this change OK? (ACK?)

Yours,
Linus Walleij
