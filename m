From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 3/9] i2c: tegra: Prevent interrupt triggering after
 transfer timeout
Date: Tue, 7 Jan 2020 12:39:00 +0000
Message-ID: <8cbdb84a50244e299297e74e7d203a0e@HQMAIL105.nvidia.com>
References: <20200106010423.5890-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:17 +0300, Dmitry Osipenko wrote:
> Potentially it is possible that interrupt may fire after transfer timeout.
> That may not end up well for the next transfer because interrupt handling
> may race with hardware resetting.
> 
> This is very unlikely to happen in practice, but anyway let's prevent the
> potential problem by enabling interrupt only at the moments when it is
> actually necessary to get some interrupt event.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 70 +++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 34 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
