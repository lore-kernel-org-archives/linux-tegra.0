From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V4 6/7] arm64: dts: tegra210-p2180: Enable CPU idle support
Date: Fri, 1 Feb 2019 10:26:19 +0800
Message-ID: <92eaf9ce-a483-5ccd-0894-b72476f2ee86@nvidia.com>
References: <20190131092410.28222-1-josephl@nvidia.com>
 <20190131092410.28222-7-josephl@nvidia.com> <20190131125711.GL23438@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131125711.GL23438@ulmo>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 1/31/19 8:57 PM, Thierry Reding wrote:
> On Thu, Jan 31, 2019 at 05:24:09PM +0800, Joseph Lo wrote:
>> Enable CPU idle support for Jetson TX1 platform.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v4:
>>   * no change
>> v3:
>>   * no change
>> v2:
>>   * no change
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> index 053458a5db55..d1a492c63e96 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> @@ -305,6 +305,12 @@
>>   		cpu@3 {
>>   			enable-method = "psci";
>>   		};
>> +
>> +		idle-states {
>> +			c7 {
>> +				status = "okay";
> 
> Doesn't seem like the code currently cares, but the bindings are
> specific, so this looks good to me.
> 
> Given that we need the timer in order to get out of this state, I'm
> assuming that I should hold back on these patches until the driver
> changes have been merged to make sure we don't regress. Is that
> correct?
> 

Yes, correct. Need to make sure all the timer related stuff landed first.

Thanks,
Joseph
