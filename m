From: Richard Zhao <linuxzsc@gmail.com>
Subject: Re: [PATCH] ARM: tegra: cpufreq: move clk_get/put out of function
 tegra_cpu_init/exit
Date: Mon, 24 Dec 2012 10:26:25 +0800
Message-ID: <CANg6MZjXWLJdnZiaJ=7=ONLoyyhWHAofnHZ7CZCDR06vER7ZDg@mail.gmail.com>
References: <1356084595-17800-1-git-send-email-linuxzsc@gmail.com>
 <50D4D44F.2080203@wwwdotorg.org> <50D6DE6E.4060106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50D6DE6E.4060106@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 23, 2012 at 6:35 PM, Prashant Gaikwad <pgaikwad@nvidia.com> wrote:
> On Saturday 22 December 2012 02:57 AM, Stephen Warren wrote:
>>
>> On 12/21/2012 03:09 AM, Richard Zhao wrote:
>>>
>>> tegra_cpu_init/exit will be called every time one cpu core is online or
>>> offline. And all cpu cores share same clocks, redundant clk_get/put
>>> wast time,  so I move them out.
>>
>> I think this is reasonable.
>>
>> Prashant, Peter, any comments?
>>
>> Is any other work in tegra_cpu_init() redundant? Is tegra_cpu_init()
>> supposed to be called due to hotplug, or is that a bug in the cpufreq
>> core?
When cpu goes offline, kernel don't know whether it'll come back.
Sounds reasonable.
>
>
> Looks good. Also, instead of array we can use single variable for
> target_cpu_speed.
I think yes. If one day the cores support rate changing independently,
we can create another driver. It supposed to be another patch to do it.

Thanks
Richard
