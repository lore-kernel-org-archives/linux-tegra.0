From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] regmap: add iopoll-like atomic polling macro
Date: Thu, 9 Jan 2020 09:00:17 +0300
Message-ID: <fa5198bf-0001-3a57-017f-1b40e0188606@gmail.com>
References: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.01.2020 08:09, Sameer Pujar пишет:
> This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
> similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
> is atomic version of already available 'regmap_read_poll_timeout' macro.
> 
> It should be noted that above atomic macro cannot be used by all regmaps.
> If the regmap is set up for atomic use (flat or no cache and MMIO) then
> only it can use.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---

Could you please explain what is the targeted use-case here?
