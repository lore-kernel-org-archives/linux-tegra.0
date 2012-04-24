From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra_ventana: als and proximity sensor
	isl29018 support
Date: Tue, 24 Apr 2012 09:42:35 +0200
Message-ID: <CACRpkdY5_F91oxzTScoBehABDHZBgZy1HkDK1okUq2uTLHh=Mg@mail.gmail.com>
References: <1334645155-13799-1-git-send-email-ldewangan@nvidia.com>
	<1334645155-13799-4-git-send-email-ldewangan@nvidia.com>
	<4F8DF01D.9040900@wwwdotorg.org> <4F8FD709.60308@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4F8FD709.60308@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Colin Cross <ccross@android.com>, "olof@lixom.net" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 19, 2012 at 11:12 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Wednesday 18 April 2012 04:05 AM, Stephen Warren wrote:
>>
>> On 04/17/2012 12:45 AM, Laxman Dewangan wrote:
>>>
>>> Add the device info for ALS and proximity sensor isl29018.
>>
>>
>> a) Perhaps the vendor prefix should be "isil" not "isl". Olof, can you
>> please comment here?
>>
>
> Any comments on this? I think "isil" is good as it is the symbol in nasdaq
> also: Intersil Corporation (ISIL).
> If no objection than I can send my next version of patch ;)
>
> Adding LinusW, Mark and Grant if they have any comment here.

Like most of the kernel people I don't care much about that as long
as the string is unique ... your pick is likely the best.

Linus Walleij
