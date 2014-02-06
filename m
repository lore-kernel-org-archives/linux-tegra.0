From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: tegra: return correct error type
Date: Thu, 6 Feb 2014 14:22:03 +0100
Message-ID: <CACRpkdb-LCFK0UuxTYMu45Kh-GjPTEBfZr+o8zfD_Y_++urX5w@mail.gmail.com>
References: <1391607694-8608-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391607694-8608-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 5, 2014 at 2:41 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> When memory allocation failed, drive should return error as ENOMEM.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Patch applied for fixes with Stephen's ACK.

Yours,
Linus Walleij
