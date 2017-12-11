From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] usb: phy: tegra: Cleanup error messages
Date: Mon, 11 Dec 2017 16:44:43 +0300
Message-ID: <fbd518b4-f1c3-831e-499c-c387ad9266ee@gmail.com>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
 <20171211093744.GB10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211093744.GB10671@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 12:37, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:07:37AM +0300, Dmitry Osipenko wrote:
>> Tegra's PHY driver has a mix of pr_err() and dev_err(), let's switch to
>> dev_err() and use common errors message formatting across the driver for
>> consistency.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 72 +++++++++++++++++++++++++----------------
>>  1 file changed, 44 insertions(+), 28 deletions(-)
> 
> Can we also get rid of all the function names in error messages? I see
> that for some error messages you've removed them, but then for others
> you added them, so you remove inconsistencies on one hand and add other
> inconsistencies at the same time. =)

I've removed function names where they aren't useful and added where they are.
Of course we can change the error message instead of using function name to give
a clue from where in the code error is originated.

I'll remove function names in v2.

> Other than that, I like this.

Thanks ;)
