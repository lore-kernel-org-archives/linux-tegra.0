From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 2/9] i2c: tegra: Properly disable runtime PM on
 driver's probe error
Date: Tue, 7 Jan 2020 12:38:57 +0000
Message-ID: <7497908b738d4f19a908dbd20736fda6@HQMAIL105.nvidia.com>
References: <20200106010423.5890-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:16 +0300, Dmitry Osipenko wrote:
> One of the recent Tegra I2C commits made a change that resumes runtime PM
> during driver's probe, but it missed to put the RPM in a case of error.
> Note that it's not correct to use pm_runtime_status_suspended because it
> breaks RPM refcounting.
> 
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
