From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: use pinctrl-utils APIs for mapping
Date: Thu, 22 Aug 2013 00:30:05 +0200
Message-ID: <CACRpkdagqL2zUtsC4P0je094CnpA9iDNT-xWMbzHwAGfO-BA4w@mail.gmail.com>
References: <1377084218-13858-1-git-send-email-ldewangan@nvidia.com>
	<1377084218-13858-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377084218-13858-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 21, 2013 at 1:23 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Pin control utility functions provides the function for creating
> map lists.
>
> In place of implementing APIs locally in Tegra pin control driver
> for creating map lists, use the utility functions. This reduces
> the code size and avoid duplication.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes from V1:
> - Rebased change on top of V1.
> - Use pinctrl_utils_dt_free_map

Patch applied.

Yours,
Linus Walleij
