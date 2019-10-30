From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 06/17] dt-bindings: cpufreq: Add binding for NVIDIA
 Tegra20/30
Date: Thu, 31 Oct 2019 00:05:26 +0300
Message-ID: <b81fbaac-3566-1153-3c5c-c6b3ba2db522@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
 <20191024221416.14197-7-digetx@gmail.com> <20191029214258.GA18586@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191029214258.GA18586@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.10.2019 00:42, Rob Herring пишет:
> On Fri, 25 Oct 2019 01:14:05 +0300, Dmitry Osipenko wrote:
>> Add device-tree binding that describes CPU frequency-scaling hardware
>> found on NVIDIA Tegra20/30 SoCs.
>>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../cpufreq/nvidia,tegra20-cpufreq.txt        | 56 +++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks!
