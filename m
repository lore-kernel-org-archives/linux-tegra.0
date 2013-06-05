From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: pllc and pllxc should use pdiv_map
Date: Wed, 05 Jun 2013 10:22:02 -0600
Message-ID: <51AF65AA.2000702@wwwdotorg.org>
References: <1370437007-25596-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370437007-25596-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2013 06:56 AM, Peter De Schrijver wrote:
> The pllc and pllxc code weren't always using the correct pdiv_map to
> map between the post divider value and the hw p field. This could result
> in illegal values being programmed in the hw.

Tested-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
