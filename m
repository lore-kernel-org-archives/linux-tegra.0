From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: next/master boot: 273 boots: 63 failed, 209 passed with 1
 untried/unknown (next-20171106)
Date: Tue, 7 Nov 2017 10:12:59 +0000
Message-ID: <d8e21d87-776b-beff-62af-34e5ad1febc3@nvidia.com>
References: <5a0055f1.85a8500a.98d54.a4e4@mx.google.com>
 <20171106191713.d7jqg2b6zqchythw@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171106191713.d7jqg2b6zqchythw@sirena.co.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, "kernelci.org bot" <bot@kernelci.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org



On 06/11/17 19:17, Mark Brown wrote:
> On Mon, Nov 06, 2017 at 04:30:41AM -0800, kernelci.org bot wrote:
> 
>> Full Boot Summary:
> https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20171106/
>> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20171106/
> 
> Since Friday -next has been failing to boot tegra124-nyan-big in
> kernelci with all configs:
> 
>> arm:
> 
>>     multi_v7_defconfig:
>>         tegra124-nyan-big:
>>             lab-collabora: failing since 2 days (last pass: next-20171102 - first fail: next-20171103)
> 
> It's fine in mainline, see: 
> 
>     https://kernelci.org/boot/id/5a0030c959b514aad21cdd1a/
> 
> for boot log, history and comparisons with other trees.  Looks like
> output started grinding to a halt at the point where it starts
> requesting firmware but ICBW.

Thanks for the report. I have been looking into a failure on nyan-big
[0], but this one looks like a new failure. I will take a look.

Cheers
Jon

[0] https://lkml.org/lkml/2017/9/19/306

-- 
nvpublic
