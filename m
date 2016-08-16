From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] Input: tegra-kbc: fix inverted reset logic
Date: Tue, 16 Aug 2016 16:46:31 +0530
Message-ID: <57B2F60F.2000506@nvidia.com>
References: <1471316363-19378-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1471316363-19378-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-input-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rakesh Iyer <riyer@nvidia.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 16 August 2016 08:29 AM, Masahiro Yamada wrote:
> Commit fe6b0dfaba68 ("Input: tegra-kbc - use reset framework")
> accidentally converted _deassert to _assert, so there is no code
> to wake up this hardware.
>
> Fixes: fe6b0dfaba68 ("Input: tegra-kbc - use reset framework")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
