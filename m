From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 2/2] pinctrl: tegra: move probe to __init section
Date: Thu, 20 Sep 2018 11:15:01 -0700
Message-ID: <55d8d7831bc2504676873722958c2e4a@agner.ch>
References: <20180919012427.12439-1-stefan@agner.ch>
 <20180919012427.12439-2-stefan@agner.ch>
 <CACRpkdYZFt-FEnF86GCKqiLjFa-n3wHYLjFbvwFDWEp+AsGCZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYZFt-FEnF86GCKqiLjFa-n3wHYLjFbvwFDWEp+AsGCZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: thierry.reding@gmail.com, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.09.2018 08:16, Linus Walleij wrote:
> On Tue, Sep 18, 2018 at 6:24 PM Stefan Agner <stefan@agner.ch> wrote:
> 
>> The Tegra pinctrl drivers are always built-in. This allows to use
>> platform_driver_probe() and mark several functions as __init.
>> This allows the kernel to free about 1KiB of memory if Tegra
>> pinctrl drivers are not used.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> It appears the test robot complains about this patch, so I'll
> wait for a v2!

Yes I saw it, will send v2 of this patch only.

--
Stefan

> 
> Yours,
> Linus Walleij
