From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegra:for-4.10/bus 4/4] drivers/bus/tegra-gmi.c:97:11: error:
 'dev' undeclared
Date: Tue, 8 Nov 2016 13:13:02 +0100
Message-ID: <CALw8SCVXOqd=3B6tzE90TQa6S4BJSKmjV_Y3SrB6_Nc1_hsn+w@mail.gmail.com>
References: <201611080158.Q53HGK2q%fengguang.wu@intel.com> <20161108104745.GA3154@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108104745.GA3154-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2016-11-08 11:47 GMT+01:00 Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> On Tue, Nov 08, 2016 at 01:44:03AM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-4.10/bus
>> head:   4f95e6a5c9e433197244c91dd25102a85dbb7877
>> commit: 4f95e6a5c9e433197244c91dd25102a85dbb7877 [4/4] bus: Add support for Tegra Generic Memory Interface
>> config: arm-allmodconfig (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 4f95e6a5c9e433197244c91dd25102a85dbb7877
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/bus/tegra-gmi.c: In function 'tegra_gmi_parse_dt':
>> >> drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)
>>       dev_err(dev, "no child nodes found\n");
>>               ^~~
>>    drivers/bus/tegra-gmi.c:97:11: note: each undeclared identifier is reported only once for each function it appears in
>>
>> vim +/dev +97 drivers/bus/tegra-gmi.c
>>
>>     91                struct device_node *child;
>>     92                u32 property, ranges[4];
>>     93                int err;
>>     94
>>     95                child = of_get_next_available_child(gmi->dev->of_node, NULL);
>>     96                if (!child) {
>>   > 97                        dev_err(dev, "no child nodes found\n");
>>     98                        return -ENODEV;
>>     99                }
>>    100
>
> Sorry, this is my bad. I forgot to enable TEGRA_GMI in the default
> configuration and that caused my build tests not to pick up the new
> driver. Fixing it now.

Yeah about that. It occurred to me that my patch series did include a
patch that enables TEGRA_GMI in tegra_defconfig. Do not really know
the policy on this, should there been a patch that enables it in
tegra_defconfig? Or is usually managed later on?

Best Regards
Mirza
