From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [2/2] mfd: max77620: Add low battery monitor support
Date: Mon, 28 Jan 2019 07:16:54 +0000
Message-ID: <20190128071654.GC4678@dell>
References: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Billy Laws <blaws05@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Re-sending due to dodgy looking 'reply-to'.

On Sun, 27 Jan 2019, Billy Laws wrote:

> >This patch adds PMIC configurations for low-battery
> >monitoring by handling max77620 register CNFGGLBL1.
> >
> It might be an idea to add lbhyst configuration here and support using
> custom lbdac values to specify a different cutoff point.

Do you know why this email was sent independent of the original
submission?  Something wrong with your mailer?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
