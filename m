From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/4] mfd: max77620: add documentation for backup
 battery charging
Date: Tue, 19 Feb 2019 09:18:22 -0600
Message-ID: <CAL_JsqJkw1Ti7Jdz_1oqGHarM1aUs3odQW37SUrKZUJq6hpDsw@mail.gmail.com>
References: <20190212064353.7451-1-markz@nvidia.com> <20190212064353.7451-3-markz@nvidia.com>
 <CAL_JsqKiL8A+SBwqLzYa9djWBT1S+2kxUUB4iuKWX7EoqXouCw@mail.gmail.com> <91d3d8f8-0b96-c442-5674-3eff8209848b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <91d3d8f8-0b96-c442-5674-3eff8209848b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 18, 2019 at 8:07 PM Mark Zhang <markz@nvidia.com> wrote:
>
> On 2/19/2019 2:06 AM, Rob Herring wrote:
> > On Tue, Feb 12, 2019 at 12:44 AM Mark Zhang <markz@nvidia.com> wrote:
> >>
> >> Adding documentation for 3 new backup battery charging dts
> >> properties:
> >> - maxim,charging-current-microamp
> >> - maxim,charging-voltage-microvolt
> >> - maxim,output-resister-ohms
> >
> > What's the difference between the 77620 and 77650 as there's patches
> > on the list for the 77650 too. The properties are similar, but seems
> > to be main vs. backup battery charger. We should have common
> > properties for this.
>
> Rob, it's different. The RTC in max77620 is supplied from a backup
> battery and consumes 2.0uA (IBBATT) when no other power sources are
> available. So unlike max77620 battery charging, which provides features
> like:
>
> static enum power_supply_property max77650_charger_properties[] = {
>         POWER_SUPPLY_PROP_STATUS,
>         POWER_SUPPLY_PROP_ONLINE,
>         POWER_SUPPLY_PROP_CHARGE_TYPE
> };
>
> For backup battery charging in max77620, what we can do is just setting
> those 3 parameters. We don't know whether it's charging, whether the
> backup battery is online, the percentage of the charging progress, and
> etc. That's why I mentioned before that it's not appropriate to create
> it as a power supply driver.

Maybe so, but that's all outside the scope of the binding. Both
bindings define charging current and voltage. And other vendor's
chargers likely need the same parameters, too. So there's no reason to
have different properties.

Rob
