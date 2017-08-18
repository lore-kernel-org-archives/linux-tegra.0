From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 3/4] gpu: host1x: Improve debug disassembly formatting
Date: Sat, 19 Aug 2017 00:54:50 +0300
Message-ID: <0864cb4f-93b4-522f-bf0e-27be75a5b1d5@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818161553.27597-4-mperttunen@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 18.08.2017 19:15, Mikko Perttunen wrote:
> The host1x driver prints out "disassembly" dumps of the command FIFO
> and gather contents on submission timeouts. However, the output has
> been quite difficult to read with unnecessary newlines and occasional
> missing parentheses.
> 
> Fix these problems by using pr_cont to remove unnecessary newlines
> and by fixing other small issues.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
It's indeed a bit more readable now.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

-- 
Dmitry
