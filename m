From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
	gpio's from the device tree.
Date: Sun, 29 May 2011 20:18:09 -1000
Message-ID: <4DE336A1.5040509@firmworks.com>
References: <20110527205444.21000.90209.stgit@riker>
	<20110527205721.21000.78599.stgit@riker>
	<20110528012427.GB5971@opensource.wolfsonmicro.com>
	<BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
	<20110530033826.GE4130@opensource.wolfsonmicro.com>
	<20110530061155.GC23517@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110530061155.GC23517-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/29/2011 8:11 PM, Grant Likely wrote:
> On Mon, May 30, 2011 at 11:38:27AM +0800, Mark Brown wrote:
>> On Sun, May 29, 2011 at 08:11:34PM -0700, Olof Johansson wrote:
>>> On Fri, May 27, 2011 at 6:24 PM, Mark Brown
>>
>>>> This is a step back from the usability of the existing platform data -
>>>> the platform data uses a series of individually named GPIOs while this
>>>> uses an array of GPIO numbers with magic indexes.  The fact that you
>>>> need comments explaining what the functions of the array elements are
>>>> is a bit of a red flag here.
>>
>>> Agreed, I had similar concerns with the sdhci bindings where it used a
>>> 3-element array of gpios instead of the previous named ones. I was
>>> told it's common practice to do it that way though? Seems like a step
>>> backwards to me. :(
>>
>> Interesting...  what was the reasoning behind this?  It's a definite
>> step backwards but it does explain my major concern with the new batch
>> of device tree patches.
>
> The binding for gpios was defined a few years ago and it is in fairly
> wide use within the powerpc sphere.  The design followed the pattern
> established for specifying irqs, and in that regard satisfied the
> principle of least surprise.
>
> That said, it isn't a very large leap to go from a single 'gpios'
> property to allowing multiple named gpios properties with meaningful
> names, particularly if they are fully specified by the device
> binding, and they follow exactly the same binding semantics as the
> existing 'gpios' proprety (phandle + gpio specifier).
>
> Personally, I'm /cautious/ about saying okay to extending the binding,
> simply because once the extension is in use it is really hard to go
> back on it, but I cannot think of any reason why this particular case
> wouldn't be a good idea.  Anyone have thoughts on this?  Ben?  Mitch?


I'm currently dealing with an SoC that has over a hundred GPIOs. 
Whatever we choose, I think it should be able to handle an insane number 
of GPIOs without getting any more cumbersome that is necessary.


>
> g.
>
