using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoredProcedures
{
    static class Serializer
    {

        public static string SerializerList(String input)
        {
            return JsonConvert.SerializeObject(input);
            
        }

        /*
        public String DeSerialize(String )
        {
            return JsonConvert.DeserializeObject(input);
        }
        */
    }

}
