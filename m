From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] usb: phy: Add Kconfig entry for Tegra's PHY driver
Date: Mon, 11 Dec 2017 16:03:07 +0300
Message-ID: <6ca4c24f-93e0-6ec4-c182-c72dbc7eca74@gmail.com>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
 <20171211100248.GD10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211100248.GD10671@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 13:02, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:09:59AM +0300, Dmitry Osipenko wrote:
>> Add Kconfig entry so that other drivers other than ehci-tegra
>> (like ChipIdea) could add Tegra's PHY to build dependencies.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/host/Kconfig | 2 +-
>>  drivers/usb/phy/Kconfig  | 8 ++++++++
>>  drivers/usb/phy/Makefile | 2 +-
>>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> I don't think we actually build-depend on the PHY driver from the
> ChipIdea driver. In the past, we've refrained from modelling runtime
> dependencies using Kconfig because in some cases (such as this) it'll
> include more than necessary (ChipIdea will automatically pull in the
> USB PHY driver irrespective of whether or not Tegra is enabled).

Please take a closer look at the patch. Tegra PHY driver is only compiled if
ehci-tegra driver is compiled. So we need to decouple build dependency in order
fix it.
