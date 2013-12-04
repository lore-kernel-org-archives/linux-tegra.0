From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Wed, 04 Dec 2013 12:38:03 +0100
Message-ID: <f1ee272d52d946b211dbcdad68df7815@agner.ch>
References: <cover.1386108712.git.stefan@agner.ch>
 <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
 <20131204081021.GB7469@lee--X1> <e2ae7b9602d0c1e11f8e56ced17e9da0@agner.ch>
 <20131204100728.GA907@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131204100728.GA907@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, dev@lynxeye.de, lgirdwood@gmail.com, broonie@kernel.org, kai.poggensee@avionic-design.de, sameo@linux.intel.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Am 2013-12-04 11:07, schrieb Lee Jones:
> On Wed, 04 Dec 2013, Stefan Agner wrote:
> 
>> Am 2013-12-04 09:10, schrieb Lee Jones:
>> >> +int tps6586x_get_version(struct device *dev)
>> >> +{
>> >> +	struct tps6586x *tps6586x = dev_get_drvdata(dev);
>> >> +
>> >> +	return tps6586x->version;
>> >> +}
>> >> +EXPORT_SYMBOL_GPL(tps6586x_get_version);
>> >
>> > I thought Mark suggested that this routine was converted to a 'static
>> > inline' and moved into the header? Did you not think this was a good
>> > idea?
>> As I pointed out in the comment above, the struct tps6586x is in the C
>> file, so I would need to move that too. That's why I did not made that
>> change in the end. What do you think, should I still move (and move the
>> struct too?)
> 
> Why would the struct have to be moved if the function is inline?

True, the inline I could have done without moving the struct and the
function. Would you like me to create another revision doing this?

But moving the function needs moving of the struct tps6586x
declaration...


[Sorry, this time with answer all]
