From: Prashant G <pgaikwad@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: Remove second instance of uart clk
Date: Tue, 26 Jun 2012 08:15:09 +0530
Message-ID: <4FE92235.20908@nvidia.com>
References: <1340610908-2729-1-git-send-email-pgaikwad@nvidia.com>
 <4FE8AE9C.5000109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4FE8AE9C.5000109@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "ccross@android.com" <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 26 June 2012 12:01 AM, Stephen Warren wrote:
> On 06/25/2012 01:55 AM, Prashant Gaikwad wrote:
>> In Tegra30 clock file two clk objects were created for same UART clock.
>> Remove the duplicates and add clock aliases instead.
>>
>> Update the Tegra20 clock file to make the names consistent.
> Thanks, applied to Tegra's for-3.6/common-clk since I assume your common
> clock work will depend on this.
Thanks Stephen!!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
