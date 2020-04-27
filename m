From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 17:21:30 +0300
Message-ID: <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200427110033.GC3464906@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.04.2020 14:00, Thierry Reding пишет:
> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 10:48, Thierry Reding пишет:
>> ...
>>>> Maybe but all these other problems appear to have existed for sometime
>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>> best for v5.7.
>>>
>>> To me it doesn't sound like we have a good handle on what exactly is
>>> going on here and we're mostly just poking around.
>>>
>>> And even if things weren't working quite properly before, it sounds to
>>> me like this patch actually made things worse.
>>
>> There is a plenty of time to work on the proper fix now. To me it sounds
>> like you're giving up on fixing the root of the problem, sorry.
> 
> We're at -rc3 now and I haven't seen any promising progress in the last
> week. All the while suspend/resume is now broken on at least one board
> and that may end up hiding any other issues that could creep in in the
> meantime.
> 
> Furthermore we seem to have a preexisting issue that may very well
> interfere with this patch, so I think the cautious thing is to revert
> for now and then fix the original issue first. We can always come back
> to this once everything is back to normal.
> 
> Also, people are now looking at backporting this to v5.6. Unless we
> revert this from v5.7 it may get picked up for backports to other
> kernels and then I have to notify stable kernel maintainers that they
> shouldn't and they have to back things out again. That's going to cause
> a lot of wasted time for a lot of people.
> 
> So, sorry, I disagree. I don't think we have "plenty of time".

There is about a month now before the 5.7 release. It's a bit too early
to start the panic, IMO :)

Jon already proposed a reasonable simple solution: to keep PCIe
regulators always-ON. In a longer run we may want to have I2C atomic
transfers supported for a late suspend phase.

This should fix yours problem and it should go into stable kernels:

--- >8 ---
diff --git a/drivers/pci/controller/pci-tegra.c
b/drivers/pci/controller/pci-tegra.c
index 3e64ba6a36a8..6ac76323ca70 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1533,8 +1533,16 @@ static int tegra_pcie_get_resources(struct
tegra_pcie *pcie)
 		goto phys_put;
 	}

+	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
+	if (err) {
+		dev_err(dev, "failed to enable regulators: %d\n", err);
+		goto irq_free;
+	}
+
 	return 0;

+irq_free:
+	free_irq(pcie->irq, pcie);
 phys_put:
 	if (soc->program_uphy)
 		tegra_pcie_phys_put(pcie);
@@ -1545,6 +1553,12 @@ static int tegra_pcie_put_resources(struct
tegra_pcie *pcie)
 {
 	const struct tegra_pcie_soc *soc = pcie->soc;

+	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
+	if (err) {
+		dev_err(pcie->dev, "failed to disable regulators: %d\n", err);
+		return err;
+	}
+
 	if (pcie->irq > 0)
 		free_irq(pcie->irq, pcie);
--- >8 ---
