From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] gpio/tegra: Convert to a platform device
Date: Tue, 11 Oct 2011 14:40:31 -0700
Message-ID: <CAOesGMgeNcFcOc3D2uNefU_4RGoqSDp42piqdzsBX=F2ZUuxSQ@mail.gmail.com>
References: <1318364638-20191-1-git-send-email-swarren@nvidia.com>
	<1318364638-20191-4-git-send-email-swarren@nvidia.com>
	<20111011212915.GA706@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111011212915.GA706-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 11, 2011 at 2:29 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> @@ -333,28 +336,55 @@ static struct irq_chip tegra_gpio_irq_chip =3D=
 {
>> =A0 */
>> =A0static struct lock_class_key gpio_lock_class;
>>
>> -static int __init tegra_gpio_init(void)
>> +static int __init tegra_gpio_probe(struct platform_device *pdev)
>> =A0{
>> + =A0 =A0 struct resource *res;
>> =A0 =A0 =A0 struct tegra_gpio_bank *bank;
>> =A0 =A0 =A0 int gpio;
>> =A0 =A0 =A0 int i;
>> =A0 =A0 =A0 int j;
>>
>> + =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(tegra_gpio_banks); i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESO=
URCE_IRQ, i);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!res) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Missi=
ng IRQ resource\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 bank =3D &tegra_gpio_banks[i];
>> + =A0 =A0 =A0 =A0 =A0 =A0 bank->bank =3D i;
>> + =A0 =A0 =A0 =A0 =A0 =A0 bank->irq =3D res->start;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> + =A0 =A0 if (!res) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Missing MEM resource\=
n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (!devm_request_mem_region(&pdev->dev, res->start,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
resource_size(res),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
dev_name(&pdev->dev))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't request MEM =
resource\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 regs =3D devm_ioremap(&pdev->dev, res->start, resource_siz=
e(res));
>> + =A0 =A0 if (!regs) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't ioremap regs=
\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>
> Should you release the mem region requested above here?

As discussed on irc, this is handled by the driver core in case of
failed probe, so nevermind.


-Olof
