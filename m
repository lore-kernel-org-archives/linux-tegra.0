From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: Implement memory-controller clock
Date: Tue, 29 Jul 2014 10:18:54 -0600
Message-ID: <53D7C96E.8090307@wwwdotorg.org>
References: <1406643437-15682-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406643437-15682-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/29/2014 08:17 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> The memory controller clock runs either at half or the same frequency as
> the EMC clock.

The changes to *.c look basically identical. Is there a shared file 
where the MC clock can be defined to avoid duplication?

Other than that, this looks fine at a brief glance.
