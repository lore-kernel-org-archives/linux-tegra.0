From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V4 3/7] soc/tegra: default select TEGRA_TIMER for Tegra210
Date: Fri, 1 Feb 2019 10:23:40 +0800
Message-ID: <75c1b971-849f-de43-9ecd-c67c221ee062@nvidia.com>
References: <20190131092410.28222-1-josephl@nvidia.com>
 <20190131092410.28222-4-josephl@nvidia.com> <20190131112655.GC23438@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131112655.GC23438@ulmo>
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

On 1/31/19 7:26 PM, Thierry Reding wrote:
> On Thu, Jan 31, 2019 at 05:24:06PM +0800, Joseph Lo wrote:
>> The tegra timer is necessary for Tegra210 to support CPU idle power-down
>> state. So select it by default.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v4:
>>   * new added in this version
>> ---
>>   drivers/soc/tegra/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
> 
> So this technically depends on patch 2/7, so it would make sense for
> Daniel or Thomas to pick this up along with 2/7, but you didn't Cc them,
> so they're not aware of this.
> 
> I think you need to either resend the series and Cc both Daniel and
> Thomas on all the patches in the series, or we have to make sure that
> this patch is not applied before patch 2/7, otherwise Kconfig will
> complain. If you decide to resend, this patch is:

Okay, will resend this series.

Thanks for your review,
Joseph

> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Thierry
> 
