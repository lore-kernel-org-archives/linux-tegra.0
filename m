From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: tegra124: Make of_device_id array const
Date: Fri, 29 Aug 2014 07:10:29 +0200
Message-ID: <CACRpkdYd_eVp82zj=5FsM6mVybvv4rC5=sm4tratmdyCzefxYQ@mail.gmail.com>
References: <1407765741-3846-1-git-send-email-kiran.padwal21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407765741-3846-1-git-send-email-kiran.padwal21@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Padwal <kiran.padwal21@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 11, 2014 at 4:02 PM, Kiran Padwal <kiran.padwal21@gmail.com> wrote:

> Make of_device_id array const, because all OF functions handle it as const.
>
> Signed-off-by: Kiran Padwal <kiran.padwal21@gmail.com>

Applied and squashed.

Yours,
Linus Walleij
