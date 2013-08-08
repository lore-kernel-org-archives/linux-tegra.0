From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAxLzNdIGh3bW9uOiAobG05MCkgQWRkIHBvd2VyIGNv?=
 =?UTF-8?B?bnRyb2w=?=
Date: Thu, 08 Aug 2013 13:57:14 +0400
Message-ID: <1375955834.368114617@f197.i.mail.ru>
References: <1375944991-29182-1-git-send-email-wni@nvidia.com>
 <520359E9.1000600@roeck-us.net> <52036920.4050808@nvidia.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52036920.4050808@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?V2VpIE5p?= <wni@nvidia.com>
Cc: =?UTF-8?B?c3dhcnJlbkB3d3dkb3Rvcmcub3Jn?= <swarren@wwwdotorg.org>, =?UTF-8?B?bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw==?= <linux-kernel@vger.kernel.org>, =?UTF-8?B?bG0tc2Vuc29yc0BsbS1zZW5zb3JzLm9yZw==?= <lm-sensors@lm-sensors.org>, =?UTF-8?B?a2hhbGlAbGludXgtZnIub3Jn?= <khali@linux-fr.org>, =?UTF-8?B?TWF0dGhldyBMb25nbmVja2Vy?= <MLongnecker@nvidia.com>, =?UTF-8?B?bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn?= <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?bGludXgtdGVncmFAdmdlci5rZXJuZWwub3Jn?= <linux-tegra@vger.kernel.org>, =?UTF-8?B?R3VlbnRlciBSb2Vjaw==?= <linux@roeck-us.net>
List-Id: linux-tegra@vger.kernel.org

> On 08/08/2013 04:42 PM, Guenter Roeck wrote:
> > On 08/07/2013 11:56 PM, Wei Ni wrote:
> >> The device lm90 can be controlled by the vdd rail.
> >> Adding the power control support to power on/off the vdd rail.
> >> And make sure that power is enabled before accessing the device.
> >>
> >> Signed-off-by: Wei Ni <wni@nvidia.com>
> >> ---
> >>   drivers/hwmon/lm90.c |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
[...]
> > I consider the messages unnecessary and confusing. You are polluting the log
> > of pretty much every PC user who has one of the supported chips in the system,
> > and of everyone else not using regulators for this chip.
> 
> Ok, I will remove these codes.
> So I will write something like:
> if (!IS_ERR(data->lm90_reg)) {
>     ret = regulator_enable(data->lm90_reg);
>     if (ret < 0) {
>         dev_err();
>         return ret;
>     }
> } else {
>     if (PTR_ERR(data->lm90_reg) == -EPROBE_DEFER)
>         return -EPRPBE_DEFER;
> 
>         data->lm90_reg = !!IS_ERR(data->lm90_reg);

No. You do not need this line.

Just use in remove():
if (!IS_ERR(data->lm90_reg))
regulator_disable(data->lm90_reg);

---
