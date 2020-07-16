From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v3 04/18] i2c: tegra: Remove NULL pointer check before
 clk_enable/disable/prepare/unprepare
Date: Thu, 16 Jul 2020 23:25:18 +0300
Message-ID: <16e08405-8b71-e427-e675-6499e012a5b6@gmail.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1594786855-26506-5-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

15.07.2020 07:20, Sowjanya Komatineni пишет:
> clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
> implementation for checking clk pointer not NULL and clock consumers
> can safely call these APIs without NULL pointer check.
> 
> So, this patch cleans up Tegra i2c driver to remove explicit checks
> before these APIs.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
