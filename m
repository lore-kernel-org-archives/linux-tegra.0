From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: Make clock initialization more robust
Date: Wed, 17 Sep 2014 09:19:23 -0600
Message-ID: <5419A67B.8060909@wwwdotorg.org>
References: <1410946457-24669-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410946457-24669-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mike Turquette <mturquette@linaro.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org

On 09/17/2014 03:34 AM, Tomeu Vizoso wrote:
> Don't abort clock initialization if we cannot match an entry in
> tegra_clk_init_table to a valid entry in the clk array.
>
> Also log a corresponding error message.
>
> This was discovered when testing a patch that removed the EMC clock from
> tegra124_clks but left a mention in tegra_clk_init_table.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
