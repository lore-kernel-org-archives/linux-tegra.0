From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] bus: tegra-aconnect: use devm_clk_*() helpers
Date: Tue, 12 Mar 2019 15:28:41 +0000
Message-ID: <b4d6bbde-2c65-a46c-febf-38bc6a92683b@nvidia.com>
References: <1552401249-29838-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552401249-29838-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/03/2019 14:34, Sameer Pujar wrote:
> aconnect bus driver is using pm_clk_*() for managing required clocks. With
> this, clocks seem to be always ON. This happens because, the clock prepare
> count is incremented in pm_clock_acquire() which is called during device
> probe(). The count is decremented during remove(). Hence the prepare_count
> for the clock is non-zero till the remove() gets executed. This is true for
> BPMP managed clock sources, where clock enable and disable happens during
> prepare and unprepare phases respectively. Thus clocks remain ON always and
> that is why pm_clk_*() cannot be used on Tegra.

Same comments here as for the ADMA patch. This is not completely true
for all devices.

> This patch replaces pm_clk_*() with devm_clk_*() and runtime PM callbacks
> reflect this. System suspend/resume can use pm_runtime_force_suspend/resume

You need to explain the last bit more. In fact I don't believe it
belongs in this patch.

Cheers
Jon

-- 
nvpublic
