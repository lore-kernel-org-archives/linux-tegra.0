From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 7/7] i2c: tegra: remove BUG, BUG_ON
Date: Tue, 11 Jun 2019 14:38:25 +0300
Message-ID: <745086cc-9470-a1af-7339-fbca35525479@gmail.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-7-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560250274-18499-7-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

11.06.2019 13:51, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Remove BUG() and make Rx and Tx case handling
> similar. Add WARN_ON_ONCE check for non-zero rx_fifo_avail
> in tegra_i2c_empty_rx_fifo() and return new error
> I2C_ERR_UNEXPECTED_STATUS.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---

Please see my answer to v4.
