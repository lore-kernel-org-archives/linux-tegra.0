From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/4] Introduce table driven initializations
Date: Wed, 04 Sep 2013 14:11:19 -0600
Message-ID: <522793E7.3020000@wwwdotorg.org>
References: <1378304438-7780-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378304438-7780-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Joseph Lo <josephl@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/04/2013 08:20 AM, Peter De Schrijver wrote:
> This patchset introduces a table driven initialization method for the
> audio, PMC and gate clocks. It's similar to the table we already have for                                                                                      
> the periph clocks.                                                                                                                                             
> 
> Changes since v1:
> 
> * Use parent names directly in TEGRA_INIT_DATA_GATE()

For the record, I said the following in response to V1 which still applies:

I assume these patches will all go through Mike's clock tree for 3.13.

Aside from the one issue I mentioned, the series,
Acked-by: Stephen Warren <swarren@nvidia.com>

I assume this will be followed by changes to convert the Tegra20/30
clock drivers to be table-based too?
